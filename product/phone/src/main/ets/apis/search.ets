import { recommendList } from '@meihui/common';
import { fetchData } from '@meihui/common/src/main/ets/utils/http';

export interface SearchResult {
  conditions: Conditions;
  pageData: PageData;
}

export interface Conditions {
  brands: Brand[];
  categories: null;
}

export interface Brand {
  desc: null;
  id: string;
  logo: string;
  name: string;
  nameEn: string;
  picture: string;
  place: null;
  type: null;
}

export interface PageData {
  counts: number;
  items: recommendList[];
  page: number;
  pages: number;
  pageSize: number;
}

export interface Item {
  desc: string;
  id: string;
  name: string;
  orderNum: number;
  picture: string;
  price: string;
}


export interface ReqDataType {
  page?: number
  pageSize?: number
  keyword: string
  sortField?: 'publishTime' | 'orderNum' | 'price' | 'evaluateNum',
  sortMethod?: 'asc' | 'desc'
}

export  const getSearchListAPI=(data:ReqDataType)=>{
  return fetchData<SearchResult>({
    url:'/search/all',
    method:'POST',
    data
  })
}