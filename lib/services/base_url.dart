
class BaseUrl{
  static bool isLive = false;
  static String baseUrl = isLive == false
      ? "https://api-sandbox.glade.ng/" //test api
      : "https://google.com"; // live API;
}