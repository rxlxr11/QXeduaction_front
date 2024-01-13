export class API {
  //服务器地址
  // static readonly Url = 'http://192.168.31.62:8080'
  static readonly Url = 'http://192.168.43.171:8080'
  static readonly login = API.Url + '/login'
  static readonly register = API.Url + '/register'
  static readonly getTeachers = API.Url + '/getTeachers'
  //读取超时
  static readonly HTTP_READ_TIMEOUT = 10 * 1000
  /**
   * Http请求成功的code.
   */
  static readonly HTTP_CODE_200: number = 200;
  /**
   * wanAndroid 接口返回的成功的code.
   */
  static readonly SERVER_CODE_SUCCESS: number = 0;
}

export const enum ContentType {
  JSON = 'application/json'
}