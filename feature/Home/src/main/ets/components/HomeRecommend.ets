
import { RecommendList } from '../apis/banner'
import  { GridRowList, recommendList} from  '@meihui/common'


@Component
export struct HomeRecommend {
  recommendList:recommendList[]=new Array(6).fill({
    id: "4034793",
    name: "跟灯按弦超好玩碳纤维智能尤克里里",
    price: 599,
    picture: "https://yanxuan-item.nosdn.127.net/62107ce9769183757d9a425af9f503df.jpg",
    payCount: 0
  })
  build() {
    Column(){
      GridRowList(
        { goodrecommend:this.recommendList}
      )
    }
  }
}