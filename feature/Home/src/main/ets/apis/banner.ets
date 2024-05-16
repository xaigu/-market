//轮播图api接口
export interface BannerItem {
  hrefUrl: string;
  id: string;
  /**
   * 图片地址
   */
  imgUrl: string;
  type: string;
}
//分类列表api接口
export interface CategoryType {
  children: Child[];
  goods: Good[];
  id: string;
  name: string;
  picture: string;

}
export interface Child {
  children?: null;
  goods?: null;
  id: string;
  name: string;
  picture: string;

}

export interface Good {
  desc: string;
  id: string;
  name: string;
  orderNum: number;
  picture: string;
  price: string;

}
//新鲜好物
export interface NewGoods {
  desc: string;
  id: string;
  name: string;
  orderNum: number;
  picture: string;
  price: string;
}
//推荐列表区域
export interface RecommendList {
  id: string;
  name: string;
  payCount: number;
  picture: string;
  price: string;

}