<?php

/**
 * 
 */
class Hash {
	
	public static function make($string, $salt = '')
	{
	  return hash('sha256', $string . $salt);	
	}
	
	public static function salt($length)
	{
		if (function_exists('random_bytes')) {
			return bin2hex(random_bytes(max(1, (int)($length / 2))));
		}
		return bin2hex(openssl_random_pseudo_bytes(max(1, (int)($length / 2))));
	}
	
	public static function unique()
	{
	 return self::make(uniqid());	
	}
}


?>