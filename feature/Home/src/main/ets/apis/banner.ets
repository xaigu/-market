//轮播图api接口
import { fetchData } from '@meihui/common/src/main/ets/utils/http';

export interface BannerItem {
  hrefUrl: string;
  id: string;
  /**
   * 图片地址
   */
  imgUrl: string;
  type: string;
}
export const getBannerListAPI = () => {
  return fetchData<BannerItem[]>({
    url: '/home/banner'
  })
}

