const modeName = ['10s','60s','ENDLESS'];
String pName = '内海';

Map<String,List<int>> data = {};

void setUserData(String username,int mode,int score){//ハイスコアを登録
  if(pName==''){return;}
  if(mode<0 || mode>2){print('不正なモード : '+mode.toString());return;}
  if(data.containsKey(username)){
    if(data[username]![mode]<score){data[username]![mode] = score;}
  }else{
    data[username] = [-1,-1,-1];
  }
  return;
}

String getUserData(String username,int mode){//スコアを取得ご新規さんなら-1で初期登録
  if(data.containsKey(username)){
    int scoreTmp = data[username]![mode];
    return scoreTmp>0? scoreTmp.toString():'---';
  }else{
    setUserData(username, mode, -1);
    return '---';
  }
}