class RoomDetailData {
  String id;
  String title;
  String community;
  String subTitle;
  int size;
  String floor;
  int price;
  String roomType;
  List<String> houseImgs;
  List<String> tags;
  List<String> oriented;
  List<String> applicances;

  RoomDetailData({
    required this.id,
    required this.title,
    required this.community,
    required this.subTitle,
    required this.size,
    required this.roomType,
    required this.houseImgs,
    required this.tags,
    required this.price,
    required this.floor,
    required this.oriented,
    required this.applicances,
  });
}

var defaultData = RoomDetailData(
    id: '1111',
    title: '整租历史最低价',
    community: '中山花园',
    subTitle:
        '1) 价格低急售房源，价格超低。业主发现商机，急需用钱。可为您节省一大笔资金。房东出国急售，价格低出天际，比同类房源便宜20万，机不可失，失不再来。\n2） 装修好、设施全精品装修，典雅风格，拎包即可入住，价格实惠，值得拥有。车位、花园、家具等配套设施一应俱全，价格低至实惠底楼带10多平米的私家花园。房型正气，采光佳。小区中央位置，带地下双车位，性价比高。房东精装修，赠送价值10万的整套家电家具，拎包即可入住 \n3） 户型\n房型正气，全明，客厅和餐厅南北通透，冬暖夏凉。 \n全南朝向，2室2厅1卫，全天采光。让您时刻感受温暖的阳光\n全南朝向，小三房，采光极好，装修风格典雅，让你体验欧式贵妇生活。\n4） 交通\n交通便利，紧邻公交和地铁。周边300多条公交线路。驾车，做公交全都方便。\n邻地铁，周边交通线发达，可直达北京任意地区。私家车公交车都可以任意出行',
    size: 100,
    floor: '高楼层',
    price: 3000,
    oriented: ['南'],
    roomType: '三室',
    applicances: ['衣柜', '洗衣机'],
    tags: ["近地铁", "集中供暖", "新上", "随时看房"],
    houseImgs: [
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
      'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
    ]);
