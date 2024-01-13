import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import Teacher from '../common/bean/Teacher';
import SubjectData, { Subject } from '../common/constant/SubjectData';
import Data from '../model/DataModel'
import { API } from '../utils/http/API';
import { get, post } from '../utils/http/Request';
import { Response } from '../utils/http/Response';

const TAG = 'HomeViewModel';
const HOME_PAGE_DOMAIN = 0x00004;

export default class HomeViewModel {

  public getSubject(): Subject[] {
    return SubjectData.Subject_List;
  }


  public static  getTeachers(form): Promise<Teacher[]> {
    return new Promise((resolve: Function, reject: Function) => {
      post(API.getTeachers,form).then((data: Response) => {
        if (data.errorCode === API.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          console.error('http test1 getTeachersList failed1', JSON.stringify(data));
          reject('error3');
        }
      }).catch((err: Error) => {
        console.error('http test1 getTeachersList failed2', JSON.stringify(err));
        reject('error4');
      });
    });
  }

}