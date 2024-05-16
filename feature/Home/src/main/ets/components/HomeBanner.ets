import { BannerItem } from '../apis/banner'

@Component
export struct HomeBanner {
  private  swiperController:SwiperController=new SwiperController()
  @State bannerList:BannerItem[]=new Array(4).fill({
    id: "42",
    imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png",
    hrefUrl: "/category/1181622006",
    type: "1"
  })
  build() {
    Column(){
     Swiper(){
       ForEach(this.bannerList,(item:BannerItem)=>{
         Image(item.imgUrl)
           .width('100%')
           .aspectRatio(3/2)
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