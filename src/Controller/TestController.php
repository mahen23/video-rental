<?php
// src/Controller/TestController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class TestController
{
    #[Route('/test/rentals', name: 'test_rentals')]
    public function testRentals(): JsonResponse
    {
        return new JsonResponse(['message' => 'Test Rentals route']);
    }

    #[Route('/test/movies', name: 'test_movies')]
    public function testMovies(): JsonResponse
    {
        return new JsonResponse(['message' => 'Test Movies route']);
    }
}
