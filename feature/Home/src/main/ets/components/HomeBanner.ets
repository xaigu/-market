import { getBannerListAPI, BannerItem } from '../apis/banner'

@Component
export struct HomeBanner {
  private  swiperController:SwiperController=new SwiperController()
  @State bannerList:BannerItem[]=[]
  aboutToAppear(): void {
    this.getbannerList()
  }
  getbannerList=async ()=>{
    try {
      const res = await getBannerListAPI()
      this.bannerList = res.data.result
    } catch (e) {
      console.log('bannerlist:',e)
    }
  }
  build() {
    Column(){
     Swiper(this.swiperController){
       ForEach(this.bannerList,(item:BannerItem)=>{
         Image(item.imgUrl)
           .width('100%')
           .aspectRatio(360/240)
       })
     }
      .loop(true)
      .indicator(
        Indicator.dot()
          .itemWidth(8)
          .selectedItemWidth(24)
          .selectedColor('#191919')
      )
    }
    .width('100%')
  }
}