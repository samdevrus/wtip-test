<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>News</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script>
          $(document).ready(function() {
             var filterData = @json($_GET) ;
             $.ajaxSetup({

                headers: {

                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')

                }

            });
            $("#btnShowMore").click(function() {
              $("#btnShowMore").hide();
              var lastNewsId = $(".news_item").last().data("id");
              $.ajax({
                   type:'POST',
                   url:'getNews',
                   data:{
                          filter:filterData,
                          lastId:lastNewsId
                          },
                   success:function(news){
                        if (news) { 
                          $("#newsContainer").append(news);
                          $("#btnShowMore").show();
                        }
                   }
                });
            });
          });
        </script>
        <meta name="csrf-token" content="{{ csrf_token() }}" />

    </head>
    <body>
        <div class="position-ref full-height">

            <div class="content">
                <div class="title m-b-md">
                    Новости
                </div>
                
                <div>
                  <h3>Фильтры</h3>
                  <form action="/" method="GET">
                      Название <input name="title" type="text" value="{{ isset($_GET['title'])?$_GET['title']:"" }}"/>
                      Дата публикации с 
                      <input name="published_start" type="datetime-local" value="{{ isset($_GET['published_start'])?$_GET['published_start']:"" }}" />
                      до 
                      <input name="published_end" type="datetime-local" value="{{ isset($_GET['published_end'])?$_GET['published_end']:"" }}" /> 
                      <input type="submit" value="отфильтровать" />
                    </form>
                </div>
                <div id='newsContainer'>
                    @php
                        $news = App\News::where('is_published', 1);
                        if (isset($_GET['title']) && strlen($_GET['title'])>0) {
                          $news = $news->where('title','LIKE',"%".
                                             ($_GET['title'])."%");
                        }
                        if (isset($_GET['published_start']) && strlen($_GET['published_start'])>0) {
                          $news = $news->where('date_published',">=",
                                             ($_GET['published_start']))->whereNotNull("date_published");
                        }
                        if (isset($_GET['published_end']) && strlen($_GET['published_end'])>0) {
                          $news = $news->where('date_published',"<",
                          
                                             ($_GET['published_end']))->whereNotNull("date_published");
                        }
                        $news = $news->orderBy('id')->limit(2)->get();
                        foreach ($news as $news_item) {

                        }                  
                      @endphp
                  
                  @each('news_item', $news, 'news_item')
                </div>
              <br><div><a id='btnShowMore'>Показать еще</a></div>
            </div>
        </div>
    </body>
</html>
