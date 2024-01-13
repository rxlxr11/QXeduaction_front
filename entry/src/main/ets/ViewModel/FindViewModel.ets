import DataModel from '../model/DataModel';
import Teacher from '../common/bean/Teacher';
import { Response } from '../utils/http/Response';
import { get } from '../utils/http/Request';
import { API } from '../utils/http/API';

export default class FindViewModel {

  public static  getTeachers(): Promise<Teacher[]> {
    return new Promise((resolve: Function, reject: Function) => {
      get("http://192.168.31.62:8080/getTeachers").then((data: Response) => {
        if (data.errorCode === API.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          console.error('http test1 getBannerList failed1', JSON.stringify(data));
          reject('error3');
        }
      }).catch((err: Error) => {
        console.error('http test1 getBannerList failed2', JSON.stringify(err));
        reject('error4');
      });
    });
  }


}