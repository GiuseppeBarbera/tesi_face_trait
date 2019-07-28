<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $table = 'project';

    public function subject()
    {
        return $this->hasMany('App\Subject','id', 'id_subject');
    }
}
