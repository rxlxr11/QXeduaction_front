
import Teacher from '../common/bean/Teacher';
import { User } from '../common/bean/User';
import http from '@ohos.net.http';
import RequestMethod from '@ohos.net.http';
import ResponseCode from '@ohos.net.http';
import { IState } from './istate';


export class HomeModel {
  TeacherData: Array<Teacher>
  status: number = IState.Loading
}

export default class DataModel {


  public static readonly Teacher_List: Teacher[] = [
    {
      name: 'rxlxr1',
      gender: '男',
      age: 20,
      qualification: '本科',
      image: 'http://www.rxlxr.com/images/user/avatar.png',

      id: 3,
      subject: '语文',
      salary: 100,
      ability: 'shdahusahddddusahdhaishdshaduusabmcksnkcnkssuagugsajsgajgdkjsgjkdgasdjgsjdgjkasgdjkshadkjhlksaklshdjklajdlkjasdkgjchjkdchksjlhcjklhdjkslhdjklshjdkhJDKHJKhjakhjdkhajkfhdajkfhjkahfjkahfjkadhfkjahdfjkhadkfjklfaklfhjkahfjkdahfjkhafdjkhfdqajkhfjkahdfjkahfjkahfjkahfjhadjfhajhfjkadhjfkdahjhdsajkfhjkdasfhjdlsfhdsajfkafhjajkfjklahdkahsuixhsiuaghxushaiuxhiashxioahixohasiisaxiohasxiohasihioahixjajxihaxiohaioxhiojaoijxhjkfl;adjf;kadjfk;dajfkdja;fdahadljhdajkhfjkdahfjkdhafjkhdajfkhdjfddafdjkahjfamhjdfhajfhddjkafjfdkljfkadjfklajkflajcnk',
      region: 'jingkou',
      year: 4,
    },
    {
      name: 'rxlxr2',
      gender: 'nv',
      age: 21,
      qualification: 'dai',
      image: 'http://www.rxlxr.com/images/user/avatar.png',

      id: 2,
      subject: '语文',
      salary: 100,
      ability: 'shdahusahddddusahdhaishdshaduusabmcksnkcnkscnk',
      region: 'jingkou',
      year: 4,
    }
  ];


  public static readonly HOT_TEACHER: Teacher = {
    name: 'rxlxr2_hot',
    gender: 'nv',
    age: 21,
    qualification: 'dai',
    image: 'http://www.rxlxr.com/images/user/avatar.png',

    id: 1,
    subject: '语文',
    salary: 100,
    ability: 'shdahusahddddusahdhaishdshaduusabmcksnkcnkscnk',
    region: 'jingkou',
    year: 4,
  }

}
