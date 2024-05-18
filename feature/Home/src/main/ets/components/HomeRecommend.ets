
import { RecommendList, recommendListAPI } from '../apis/RecommendList'
import  { GridRowList, recommendList} from  '@meihui/common'


@Component
export struct HomeRecommend {
  @State
  recommendList:recommendList[]=[]
  aboutToAppear(): void {
    this.getcommednlist()
  }
  getcommednlist=async ()=>{
    try {
      const res = await recommendListAPI()
      // console.log('推荐',JSON.stringify(res.data.result,null,2))
      this.recommendList = res.data.result
    } catch (e) {
      console.log('commednlist',e)
    }
  }
  build() {
    Column(){
      GridRowList(
        { goodrecommend:this.recommendList}
      )
    }
  }
}