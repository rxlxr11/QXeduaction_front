export class Service{
  Text: string = 'string'
  Color: string = '#6B9D68'
  Image: Resource | string = $rawfile('detail/physic_white.png')
}

export default class ServiceData {

  public static readonly Service_List: Service[] = [
    {
      Image: $rawfile('user/wallet.png'),
      Text: '钱包',
      Color: '#67C23A'
    },
    {
      Image: $rawfile('user/order.png'),
      Text: '订单',
      Color: '#409EFF'
    }
  ];

  public static readonly Menu_List: Service[] = [
    {
      Image: $rawfile('user/policy.png'),
      Text: '协议',
      Color: '#67C23A'
    },
    {
      Image: $rawfile('user/setting.png'),
      Text: '设置',
      Color: '#409EFF'
    }
  ];

}
