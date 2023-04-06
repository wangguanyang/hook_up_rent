// 资讯数据准备,注意下面的格式

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;
  final String navigateUrl;

  const InfoItem(
      this.title, this.imageUrl, this.source, this.time, this.navigateUrl);
}


const List<InfoItem> infoData = [
  InfoItem(
      '置业选择 | 三室一厅 河间的古雅豪华大别墅',
      'https://img1.baidu.com/it/u=647216979,2929381416&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500',
      "新华网",
      "两天前",
      'login'),
  InfoItem(
      '置业佳选 | 大理王宫 苍山洱海间的古雅别院',
      'https://img0.baidu.com/it/u=274432472,1516760188&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500',
      "新华网",
      "一周前",
      'login'),
  InfoItem(
      '置业选择 | 安居小屋 花园洋房 清新别野',
      'https://aihome.aihome365.cn/2018/05/690b6a14-141b-4c93-840d-50168a3be7e3.jpg?x-oss-process=style/aihome',
      "新华网",
      "一周前",
      'login'),
  InfoItem(
      '置业选择 | 安居小屋 花园洋房 清新别野 山清水秀',
      'https://yun50.qfangimg.com/group1/1000x1000/M00/B5/44/CpmSzVbjeu-ABRSGAAFWhw3XSso680.jpg',
      "新华网",
      "一周前",
      'login'),
  InfoItem(
      '置业选择 | 安居小屋 花园洋房 清新别野',
      'https://aihome.aihome365.cn/2018/04/da71f57f-0dcf-4005-863a-5eee79a2175f.jpg?x-oss-process=style/aihome',
      "新华网",
      "一周前",
      'login'),
];
