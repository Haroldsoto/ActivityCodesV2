using System;
using System.Data;
using System.Linq;
using System.Web.Mvc;
using ActivityCodesV2.Models;

namespace ActivityCodesV2.Controllers
{
    public class MainController : Controller
    {
        private ActivityCodesModelContainer db = new ActivityCodesModelContainer();

        //
        // GET: /Main/

        public ViewResult Index()
        {
            ViewBag.Products = db.Products.ToList().Select(c => new SelectListItem
            {
                Text = c.Description,
                Value = c.Code
            }).OrderBy(c => c.Text);
            ViewBag.Transactions = db.Transactions.ToList().Select(c => new SelectListItem
            {
                Text = c.Description,
                Value = c.Code
            }).OrderBy(c => c.Text);
            return View();
        }

        [HttpPost]
        public ActionResult Index(Call call)
        {

            return View();
        }

        public ActionResult GetTransactions(string products)
        {
            var transactions = db.Transactions.Where(c => c.IsInProduct.Contains(products))
                .ToList()
                .Select(c => new SelectListItem
                {
                    Text = c.Description,
                    Value = c.Code
                }).OrderBy(c => c.Text);
            return Json(transactions, JsonRequestBehavior.AllowGet);
        }

        //
        // GET: /Main/Details/5

        public ViewResult Details(int id)
        {
            Call call = db.Calls.Find(id);
            return View(call);
        }

        //
        // GET: /Main/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Main/Create

        [HttpPost]
        public ActionResult Create(Call call)
        {
            if (ModelState.IsValid)
            {
                db.Calls.Add(call);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(call);
        }

        //
        // GET: /Main/Edit/5

        public ActionResult Edit(int id)
        {
            Call call = db.Calls.Find(id);
            return View(call);
        }

        //
        // POST: /Main/Edit/5

        [HttpPost]
        public ActionResult Edit(Call call)
        {
            if (ModelState.IsValid)
            {
                db.Entry(call).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(call);
        }

        //
        // GET: /Main/Delete/5

        public ActionResult Delete(int id)
        {
            Call call = db.Calls.Find(id);
            return View(call);
        }

        //
        // POST: /Main/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Call call = db.Calls.Find(id);
            db.Calls.Remove(call);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        [HttpPost]
        public ActionResult RegisterCall(string activityCode, string activityCodeText)
        {
            var currentUser = User.Identity.Name;
            var date = DateTime.UtcNow.AddHours(-4);
            db.Calls.Add(new Call
            {
                StartDate = date,
                EndDate = (System.DateTime)null
            });
            db.SaveChanges();
            var callId = db.Calls.Where(m => m.StartDate == date).Select(m => m.Id).FirstOrDefault(); //Seleccionar Id de la llamada para incluir en tabla Activities
            db.Activities.Add(new Activity
            {
                ActivityCode = activityCode,
                Agent = currentUser,
                Date = date,
                Description = activityCodeText,
                CallId = callId
            });
            db.SaveChanges();
            return Json(new {result = true});
        }
    }
}