
import ServiceData, { Service } from '../common/constant/ServiceData';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { User } from '../common/bean/User';
import { Order } from '../common/bean/Order';
import { get } from '../utils/http/Request';
import { Response } from '../utils/http/Response';
import { API } from '../utils/http/API';


const TAG = 'UserViewModel';
const HOME_PAGE_DOMAIN = 0x00005;

export default class UserViewModel {


  public static getOrder(user_id): Promise<Order[]> {
    return new Promise((resolve: Function, reject: Function) => {
      get("http://192.168.31.62:8080/getOrder"+"?user_id="+user_id,user_id).then((data: Response) => {
        if (data.errorCode === API.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          console.error('order', JSON.stringify(data));
          reject('error3');
        }
      }).catch((err: Error) => {
        console.error('order', JSON.stringify(err));
        reject('error4');
      });
    });
  }


  public getService(): Service[] {
    return ServiceData.Service_List;
  }



  public getMenu(): Service[] {
    return ServiceData.Menu_List;
  }


}