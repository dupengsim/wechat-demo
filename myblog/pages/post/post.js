var app = getApp();
import { BASE_URL } from '../../utils/constant.js'


Page({
  /**
   * 页面的初始数据
   */
  data: {
    hidden: true,
    scrollTop: 0,
    scrollHeight: 0,
    pageIndex: 1,
    pageSize: 10,
    pageCount: 0,
    concatData: [],
    initData: [],
    isLoading: true,
    categoryId: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    if (options.cid) {
      that.setData({
        categoryId: options.cid
      })
    }
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          scrollHeight: res.windowHeight
        });
      }
    });
    wx.showNavigationBarLoading();
    wx.showLoading({
      title: '加载中...',
    })
    that.getData();
  },
  onTap: function (evt) {
    var postid = evt.currentTarget.dataset.postid;
    wx.navigateTo({
      url: 'post-detail/post-detail?id=' + postid
    })
  },
  bindDownLoad: function () {// 页面滑动到底部的事件，下拉加载更多
    let that = this;
    var currentPage = that.data.pageIndex + 1;
    var totalPage = Math.ceil(that.data.pageCount / that.data.pageSize);
    if (currentPage > totalPage) {
      that.setData({
        isLoading: false
      })
    } else {
      that.setData({
        pageIndex: currentPage,
        pageSize: that.data.pageSize
      })
      that.getData();
    }
  },
  scroll: function (event) { //页面滚动时的事件
    this.setData({
      scrollTop: event.detail.scrollTop
    });
  },
  refresh: function (event) { //页面滑动到顶部的事件，上拉刷新
    let that = this;
    that.setData({
      scrollTop: 0,
      pageIndex: 1,
      pageSize: 10,
      initData: []
    })
    that.getData();
  },
  getData: function () {
    var that = this;
    that.setData({
      hidden: false
    });
    var obj = {
      pageIndex: that.data.pageIndex,
      pageSize: that.data.pageSize
    };
    var _categoryId = that.data.categoryId;
    if (_categoryId != undefined && _categoryId != "" && _categoryId.length > 0) {
      obj.categoryId = _categoryId;
    }
    that.loadData(obj);
  },
  formatter: function (list) {
    return list.map((item) => {
      var time = item.createDate.substring(0, item.createDate.lastIndexOf('T'));
      item.createDate = time;
      return item;
    })
  },
  loadData: function (obj) {
    let that = this;
    var url = BASE_URL + "api/getArticleList";
    app.http_get(url, obj).then((res) => {
      wx.hideNavigationBarLoading();
      wx.hideLoading();
      var newData = that.formatter(res.data.data);
      var result = that.data.initData.concat(newData);
      that.setData({
        postList: result,
        initData: result,
        hidden: true,
        pageCount: res.data.total
      })
    });
  }
})