<?php

namespace App\Http\Controllers;
use App\News;
use Illuminate\Http\Request;


class AjaxController extends Controller
{
     public function getNews(Request $request)

    {
        $lastId = 0;
        if (isset($request->lastId)) {
          $lastId = $request->lastId;
        }
        $news = News::where('is_published', 1)->where('id','>',$lastId);
        if (isset($request->filter)) {
            if (isset($request->filter['title']) && strlen($request->filter['title'])>0) {
            $news = $news->where('title','LIKE',"%".
                             ($request->filter['title'])."%");

            }
            //return response()->json($request);
            if (isset($request->filter['published_start']) && strlen($request->filter['published_start'])>0) {
            $news = $news->where('date_published',">=",
                             ($request->filter['published_start']))->whereNotNull("date_published");
            }
            if (isset($request->filter['published_end']) && strlen($request->filter['published_end'])>0) {
            $news = $news->where('date_published',"<",

                             ($request->filter['published_end']))->whereNotNull("date_published");
            }
        }
        $news = $news->orderBy('id')->limit(2)->get();
        $result = "";
        foreach ($news as $news_item) {
          $result.= view("news_item",['news_item'=>$news_item]);
        }
        return $result;

    }

   
    //function getNewsPost(Request $request) {
    //  return response()->json(['success'=>'Post.']);
    //}
}
