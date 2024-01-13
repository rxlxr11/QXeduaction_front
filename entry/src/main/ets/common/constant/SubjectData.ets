
import {subject} from './TeacherCategory'

export class Subject{
  Text: string = 'string'
  Color: string = '#6B9D68'
  Image: Resource | string = $rawfile('detail/physic_white.png')
}

export default class SubjectData {

  public static  Subject_Map: Map<number,string>

  public static readonly Subject_List: Subject[] = [
    {
      Image: $rawfile('detail/chinese_white.png'),
      Text: subject.CHINESE,
      Color: '#DDAB77'
    },
    {
      Image: $rawfile('detail/math_white.png'),
      Text: subject.MATH,
      Color: '#82ABA3'
    },
    {
      Image: $rawfile('detail/english_white.png'),
      Text: subject.ENGLISH,
      Color: '#F77E66',
    },
    {
      Image: $rawfile('detail/physic_white.png'),
      Text: subject.PHYSIC,
      Color: '#75809C',
    },
    {
      Image: $rawfile('detail/chem.png'),
      Text: subject.CHEMISTRY,
      Color: '#586D80',
    },
    {
      Image: $rawfile('detail/music_white.png'),
      Text: subject.MUSIC,
      Color: '#CBA29E',
    },
    {
      Image: $rawfile('detail/code_white.png'),
      Text: subject.CODE,
      Color: '#FED59E',
    },
    {
      Image: $rawfile('detail/else_white.png'),
      Text: subject.ELSE,
      Color: '#2A4C65',
    }
  ];

  public static readonly Subject_Name: SelectOption[] = [
    {value: "语文"},
    {value: "数学"},
    {value: "英语"},
    {value: "物理"},
    {value: "化学"},
    {value: "音乐"},
    {value: "计算机"},
    {value: "其他"}
  ]

  public static readonly  Grade_Name: SelectOption[] = [
    {value: "一年级"},
    {value: "二年级"},
    {value: "三年级"},
    {value: "四年级"},
    {value: "五年级"},
    {value: "六年级"},
    {value: "初一"},
    {value: "初二"},
    {value: "初三"},
    {value: "高一"},
    {value: "高二"},
    {value: "高三"},
    {value: "小学"},
    {value: "初中"},
    {value: "高中"},
    {value: "大学"},
  ]

}