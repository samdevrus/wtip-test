<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    //
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'news';
    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;
    
    public function author()
    {
        return $this->belongsToMany('App\User', 'news_authors', 'news_id', 'user_id')->first();
    }
}
