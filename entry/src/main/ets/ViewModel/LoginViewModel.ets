import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import Teacher from '../common/bean/Teacher';
import { User } from '../common/bean/User';
import SubjectData, { Subject } from '../common/constant/SubjectData';
import Data from '../model/DataModel'
import { API } from '../utils/http/API';
import { get,post } from '../utils/http/Request';
import { Response } from '../utils/http/Response';

const TAG = 'LoginViewModel';
const HOME_PAGE_DOMAIN = 0x00007;

export default class LoginViewModel {


  public  login(username,password): Promise<User> {

    return new Promise((resolve: Function, reject: Function) => {
      let url = API.login+"?username="+username+"&password="+password
      get(url).then((data: Response) => {
        if (data.errorCode === API.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          console.error('login failed1', JSON.stringify(data));
          reject('用户名或密码错误');
        }
      }).catch((err: Error) => {
        console.error('login failed2', JSON.stringify(err));
        reject('error4');
      });
    });
  }

  public  register(user): Promise<User> {

    return new Promise((resolve: Function, reject: Function) => {
      post(API.register,user).then((data: Response) => {
        if (data.errorCode === API.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          console.error('register failed1', JSON.stringify(data));
          reject('注册失败,用户名重复');
        }
      }).catch((err: Error) => {
        console.error('register failed2', JSON.stringify(err));
        reject('error4');
      });
    });
  }

}