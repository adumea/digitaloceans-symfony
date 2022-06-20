<?php
namespace App\Controller;

use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class LuckyController extends AbstractController
{
    public function number(ManagerRegistry $doctrine): Response
    {
        $entityManager = $doctrine->getManager();
        if ($entityManager->getConnection()->connect()) {
            echo 'DOCTRINE WORKS';
        } else {
            echo 'Could not connect';
        }
        $number = random_int(0, 100);

        return new Response(
            '<html><body>Lucky number: '.$number.'</body></html>'
        );
    }
}