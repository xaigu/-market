//推荐列表区域
import { fetchData } from '@meihui/common/src/main/ets/utils/http';

export interface RecommendList {
  id: string;
  name: string;
  payCount: number;
  picture: string;
  price: string;

}
export  const recommendListAPI=()=>{
return fetchData<RecommendList[]>({
  url:'/home/recommend',
  method:'GET'
})
}