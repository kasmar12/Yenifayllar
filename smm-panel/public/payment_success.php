<?php
session_start();
?>
<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ödəniş Uğurlu - SMM Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .success-section {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            padding: 80px 0;
        }
    </style>
</head>
<body>
    <!-- Success Section -->
    <div class="success-section text-center">
        <div class="container">
            <h1 class="display-4 mb-4">
                <i class="fas fa-check-circle"></i> Ödəniş Uğurlu!
            </h1>
            <p class="lead">Sifarişiniz uğurla yaradıldı və ödəniş edildi.</p>
        </div>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-rocket fa-3x text-success mb-3"></i>
                        <h3>Sifarişiniz İşlənir</h3>
                        <p class="text-muted">
                            Sifarişiniz sistemə qəbul edildi və SMM xidmətinə göndərildi. 
                            Status məlumatları tezliklə yenilənəcək.
                        </p>
                        
                        <div class="alert alert-info">
                            <h6><i class="fas fa-info-circle"></i> Növbəti Addımlar</h6>
                            <ul class="text-start">
                                <li>Sifarişiniz SMM xidmətinə göndərildi</li>
                                <li>Xidmət təqdim olunmağa başlayacaq</li>
                                <li>Status məlumatları real-time yenilənəcək</li>
                                <li>Tamamlanma vaxtı xidmət növündən asılıdır</li>
                            </ul>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-block">
                            <a href="index.php" class="btn btn-primary">
                                <i class="fas fa-home"></i> Ana Səhifəyə Qayıt
                            </a>
                            <a href="../admin/orders.php" class="btn btn-outline-secondary">
                                <i class="fas fa-list"></i> Sifarişləri İzlə
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>