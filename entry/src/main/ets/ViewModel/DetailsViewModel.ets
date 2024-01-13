
import DataModel from '../model/DataModel';
import  Teacher from '../common/bean/Teacher';

export default class DetailsViewModel {
  public loadDetails(position: number): Teacher {
    return DataModel.Teacher_List[position];
  }
}