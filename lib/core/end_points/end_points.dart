class EndPoints{
  static String  baseUrl  = 'http://127.0.0.1:8000/api';
  static String adminLogin ="/admin/login";
  static String adminRegister ="/admin/register";
  static String adminCategory ="/categories/getAll";
  static String getAllManufacturers ="/manufacturers/getAll";
  static String adminManufactures ="/manufacturers/getAll";
  static String adminOrders ="/orders/showAll";
  static String paymentState ="/orders/changePayment";
  static String orderState ="/orders/changeStatus";
  static String searchCategory ="/categories/search";
  static String medicinesAdd  ="/medicines/add";
  static String medicineGetAll  ="/medicines/getAll";
  static String medicinesDetails  ="/medicines/get/";
  static String dateReport  ="/bills/profits";
  static String addCompany  ="/manufacturers/add";
}