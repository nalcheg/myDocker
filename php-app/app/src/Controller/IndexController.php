<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class IndexController.
 */
class IndexController extends AbstractController
{
    /**
     * @Route("/", methods={"GET","POST"}, name="index")
     */
    public function Index(Request $request): Response
    {
        return Response::create($request->getClientIp(), 200);
    }
}
