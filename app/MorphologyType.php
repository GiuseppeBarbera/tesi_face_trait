<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MorphologyType extends Model
{
    protected $table = 'morphology_type';

    public function morphology()
    {
        return $this->hasMany('App\Morphology','id_morphology_type');
    }
}
