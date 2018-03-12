
import { BASE_URL } from '../../utils/constant.js'

Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let that = this;
    wx.request({
      url: BASE_URL + 'api/admin/findCategoryBy',
      header: {
        'Content-Type': 'application/json'
      },
      method: "GET",
      success: function (res) {
        that.setData({
          categoryList: res.data.data
        });
      }
    })
  },
  onTap: function (evt) {
    var _id = evt.currentTarget.dataset.id;
    wx.navigateTo({
      url: '/pages/post/post?cid=' + _id,
    })
  }
})