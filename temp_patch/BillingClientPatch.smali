
.method public queryPurchasesAsync(Lcom/android/billingclient/api/QueryPurchasesParams;Lcom/android/billingclient/api/PurchasesResponseListener;)V
    .locals 4
    
    # Saxta purchase list yaradır
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    
    # Premium subscription purchase yaradır
    new-instance v1, Lcom/android/billingclient/api/Purchase;
    invoke-direct {v1}, Lcom/android/billingclient/api/Purchase;-><init>()V
    
    # Purchase state = PURCHASED (1)
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/Purchase;->setPurchaseState(I)V
    
    # Product ID = premium_subscription
    const-string v3, "premium_subscription"
    invoke-virtual {v1, v3}, Lcom/android/billingclient/api/Purchase;->setProductId(Ljava/lang/String;)V
    
    # Purchase token = fake_token
    const-string v3, "fake_token_12345"
    invoke-virtual {v1, v3}, Lcom/android/billingclient/api/Purchase;->setPurchaseToken(Ljava/lang/String;)V
    
    # Acknowledged = true
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Lcom/android/billingclient/api/Purchase;->setIsAcknowledged(Z)V
    
    # List-ə əlavə et
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    
    # Listener-ə göndər
    invoke-interface {p2, v0}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Ljava/util/List;)V
    
    return-void
.end method
