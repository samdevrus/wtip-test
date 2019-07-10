<div class='news_item' data-id='{{ $news_item->id }}'>
    <h2>{{ $news_item->title }}</h2>
    <span>{{ mb_strimwidth($news_item->description,0,140,"...") }}</span>
    <div>
        <span>Автор: {{ $news_item->author()->name }}</span> 
        <span>Дата публикации: {{ date("j F Y G:i", strtotime($news_item->date_published)) }}</span>
    </div>
</div>    