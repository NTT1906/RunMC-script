<?php
declare(strict_types=1);

$lockFilePath = dirname(__DIR__) .  '\server.lock';
try {
    $resource = fopen($lockFilePath, "a+b");
    if(!flock($resource, LOCK_EX | LOCK_NB)){
        //wait for a shared lock to avoid race conditions if two servers started at the same time - this makes sure the
        //other server wrote its PID and released exclusive lock before we get our lock
        flock($resource, LOCK_SH);
        $pid = stream_get_contents($resource);
        if(preg_match('/^\d+$/', $pid) === 1){
            exec("taskkill /f /pid $pid");
        }
    }
    fclose($resource);
} catch (ErrorException $e) {
    print($e->getMessage());
}