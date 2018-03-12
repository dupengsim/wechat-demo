var WxParse = require('../../../wxParse/wxParse.js');
import { BASE_URL } from '../../../utils/constant.js'

var app = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    currentPostId: '',
    categoryName: '',
    comment: "", // 保存评论文本框的内容
    commentlist: [],//评论列表
    isLoading: true,//是否显示加载数据提示
    disabled: true,
    cfBg: false,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    let that = this;
    wx.showNavigationBarLoading();
    wx.showLoading({
      title: '加载中...',
    });
    that.loadData(options.id); // 加载文章详情
    that.fetchPrevAndNext(options.id);//加载上一条、下一条
    that.loadComments(options.id);// 加载评论列表
  },
  ontap: function (evt) {
    let that = this;
    var postid = evt.currentTarget.dataset.postid;
    wx.navigateTo({
      url: 'post-detail?id=' + postid
    })
  },
  loadData: function (id) {
    let that = this;
    app.http_get(BASE_URL + 'api/articledetail', { _id: id }).then((res) => {
      wx.hideNavigationBarLoading();
      wx.hideLoading();
      var postDetail = res.data.data;
      that.categoryName = res.data.tempData.categoryname
      var time = postDetail.createDate;
      postDetail.createDate = time.substring(0, time.lastIndexOf('T'));
      var article = postDetail.content;
      // 显示html格式内容
      WxParse.wxParse('article', 'html', article, that, 5);
      that.setData(postDetail);
      that.setData({
        categoryName: that.categoryName,
        currentPostId: id
      })
    });
  },
  loadComments: function (id) {
    this.loadCommentList(id);
  },
  loadCommentList: function (id) {
    let that = this;
    app.http_get(BASE_URL + 'api/getCommentList', { _articleId: id }).then((res) => {
      var newdata = that.formatter(res.data.data);
      that.setData({
        commentlist: newdata
      })
    });
  },
  formatter: function (list) {
    return list.map((item) => {
      var time = item.createDate.substring(0, item.createDate.lastIndexOf('T'));
      item.createDate = time;
      item.ipAddress = item.ipAddress.substring(7);
      return item;
    })
  },
  fetchPrevAndNext: function (id) {
    let that = this;
    app.http_get(BASE_URL + 'api/preAndNext', { _id: id }).then((res) => {
      if (res.data.preData && res.data.preData.length > 0) {
        that.setData({
          prevData: res.data.preData[0]
        })
      }
      if (res.data.nextData && res.data.nextData.length > 0) {
        nextData: res.data.nextData[0]
      }
    });
  },
  fetchcategorylist: function (evt) {
    let that = this;
    var _categoryId = evt.currentTarget.dataset.categoryid;
    wx.redirectTo({
      url: '../../../pages/post/post?cid=' + _categoryId
    })
  },
  submit: function (e) {
    let that = this;
    var _comments = that.data.comment;
    var _id = that.data.currentPostId;
    if (_comments == undefined || _comments == '' || _comments.length <= 0) {
      wx.showToast({
        title: '内容不能为空',
        icon: 'none',
        duration: 2000
      })
    } else {
      var regex = /select|update|delete|exec|count|'|"|=|;|>|<|%/i;
      if (regex.test(_comments)) {
        wx.showToast({
          title: '存在非法字符',
          icon: 'none',
          duration: 2000
        })
      } else {
        var obj = {
          articleId: _id,
          content: _comments
        };
        app.http_post(BASE_URL + 'api/saveCommentByWechat', obj).then((res) => {
          if (res.data.code === 200) {
            that.setData({ // 清空评论框中的内容
              comment: ''
            })
            that.loadCommentList(_id);// 重新加载评论列表 
            wx.showToast({
              title: '评论成功',
              icon: 'success',
              duration: 1000
            })
          }
        });
      }
    }
  },
  //文本域失去焦点时 事件处理
  textAreaBlur: function (e) {
    //获取此时文本域值
    this.setData({
      comment: e.detail.value
    })

  },
  //文本域获得焦点事件处理
  textAreaFocus: function () {
    this.setData({
      isShow: false,
      cfBg: false
    })
  },
  textAreaInput: function (e) {
    this.setData({
      comment: e.detail.value
    })
  }
})