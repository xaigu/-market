import { router } from '@kit.ArkUI'
import { GridRowList, recommendList } from '@meihui/common'
import { getSearchListAPI, Item } from '../apis/search'

interface  tabname{
  tab:string
}

@Entry
@Component
struct SearchResult {
@State TabContebt:string=''
  @State GoodsList:recommendList[]=[]
  getGoodsList=async ()=>{
    try {
      const res = await getSearchListAPI({
        keyword: this.TabContebt,
        page: 1,
        pageSize: 10
      })
      this.GoodsList = res.data.result.pageData.items
    } catch (e) {
      console.log('searchresult',e)
    }
  }
  aboutToAppear(): void {
const res=router.getParams() as tabname
    if (res) {
      this.TabContebt=res.tab
      this.getGoodsList()
    }

  }
  build() {
   Column(){
     //搜索输入区域
// this.TabBuilder()
     Navigation(){
       Scroll(){
         GridRowList({
           goodrecommend:this.GoodsList
         })
       }

     }
     .title(this.TabContebt)
     .titleMode(NavigationTitleMode.Mini)

   }
  }
  @Builder
  TabBuilder(){
    Navigation(){}
    .title(this.TabContebt)
    .titleMode(NavigationTitleMode.Mini)
  }
}