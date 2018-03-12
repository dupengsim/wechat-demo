//app.js
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
      }
    })
    // 获取用户信息
    wx.getSetting({
      success: res => {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
          wx.getUserInfo({
            success: res => {
              // 可以将 res 发送给后台解码出 unionId
              this.globalData.userInfo = res.userInfo

              // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
              // 所以此处加入 callback 以防止这种情况
              if (this.userInfoReadyCallback) {
                this.userInfoReadyCallback(res)
              }
            }
          })
        }
      }
    })
  },
  globalData: {
    userInfo: null
  },
  /** 
    * 自定义post请求函数，返回Promise
    */
  http_post: function (url, data) {
    var promise = new Promise((resolve, reject) => {
      //init
      var that = this;
      var postData = data;
      //网络请求
      wx.request({
        url: url,
        data: postData,
        method: 'POST',
        header: { 'content-type': 'application/x-www-form-urlencoded' },
        success: function (res) {//返回取得的数据
          resolve(res);
        },
        error: function (e) {
          reject('网络出错');
        }
      })
    });
    return promise;
  },
  /** 
    * 自定义get请求函数，返回Promise
    */
  http_get: function (url, data) {
    var promise = new Promise((resolve, reject) => {
      //init
      var that = this;
      var postData = data;
      //网络请求
      wx.request({
        url: url,
        data: postData,
        method: 'GET',
        header: { 'content-type': 'application/json' },
        success: function (res) {//返回取得的数据
          resolve(res);
        },
        error: function (e) {
          reject('网络出错');
        }
      })
    });
    return promise;
  }
})