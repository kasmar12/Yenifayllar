.class public interface abstract Lcom/google/firebase/firestore/remote/WatchChangeAggregator$TargetMetadataProvider;
.super Ljava/lang/Object;
.source "WatchChangeAggregator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/remote/WatchChangeAggregator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TargetMetadataProvider"
.end annotation


# virtual methods
.method public abstract getDatabaseId()Lcom/google/firebase/firestore/model/DatabaseId;
.end method

.method public abstract getRemoteKeysForTarget(I)Lcom/google/firebase/database/collection/ImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/firebase/database/collection/ImmutableSortedSet<",
            "Lcom/google/firebase/firestore/model/DocumentKey;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTargetDataForTarget(I)Lcom/google/firebase/firestore/local/TargetData;
.end method
