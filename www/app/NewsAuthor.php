<?php

namespace App;

use Illuminate\Database\Eloquent\Relations\Pivot;

class NewsAuthor extends Pivot
{
    //
    protected $table = 'news_authors';

}
