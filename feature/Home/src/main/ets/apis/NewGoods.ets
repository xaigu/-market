//新鲜好物
import { fetchData } from '@meihui/common/src/main/ets/utils/http';
import Fetch from '@system.fetch';

export interface NewGoods {
  desc: string;
  id: string;
  name: string;
  orderNum: number;
  picture: string;
  price: string;
}

export  const getNewGoodsAPI=()=>{
  return fetchData<NewGoods[]>({
    url:'/home/new',
    method:'GET'
  })
}