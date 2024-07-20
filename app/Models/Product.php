<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public const UPDATED_AT = null;
    protected $fillable = [
        "id",
        "name",
        "price",
        "category",
        "created_at"
    ];
}
