
.method public isPremiumUser()Z
    .locals 1
    
    # Həmişə true qaytarır
    const/4 v0, 0x1
    return v0
.end method

.method public hasActiveSubscription()Z
    .locals 1
    
    # Həmişə true qaytarır
    const/4 v0, 0x1
    return v0
.end method

.method public getSubscriptionType()Ljava/lang/String;
    .locals 1
    
    # Premium qaytarır
    const-string v0, "premium"
    return-object v0
.end method
