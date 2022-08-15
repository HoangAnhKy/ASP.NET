Sử dụng Validation

B1: sử dụng hình ảnh gợi ý validation để tạo validated trong model

B2: sử dụng các hàm này để tạo biến thông báo
```
@Html.ValidationSummary(true, "", new { @class = "text-danger" }) khai báo tất cả các lỗi lên trên cùng
@Html.ValidationMessageFor(model => model.password, "", new { @class = "text-danger" }) khai báo lỗi cụ thể tại vị trí đó
```
B3: nhớ sử dụng đúng theo cú pháp sau

	if (ModelState.IsValid)
    	{            }
      else
      { return View(Model truyền vào); }

lưu ý phải gọi model của nó thì mới sử dụng được vd: @model CRUD.Models.Login, và nên tạo 2 controller(get, post) để quản lý cho tiện

vd:
  	  [HttpGet]
        public ActionResult register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult register(Login lg)
        {
            if (ModelState.IsValid)
            {
                var obj = new Login();
                obj.name = lg.name;
                obj.email = lg.email;
                obj.password = lg.password;
                obj.level = 1;
                db.Logins.Add(obj);
                db.SaveChanges();
                return RedirectToAction("signin", "Auth");
            }
            else
            {
                return View(lg);
            }
        }