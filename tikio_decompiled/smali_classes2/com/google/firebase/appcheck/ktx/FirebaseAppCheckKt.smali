.class public final Lcom/google/firebase/appcheck/ktx/FirebaseAppCheckKt;
.super Ljava/lang/Object;
.source "FirebaseAppCheck.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\u001a\u0012\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0006\u001a\r\u0010\u0007\u001a\u00020\u0008*\u00020\tH\u0087\u0002\u001a\r\u0010\n\u001a\u00020\u000b*\u00020\tH\u0087\u0002\"\u0015\u0010\u0000\u001a\u00020\u0001*\u00020\u00028F\u00a2\u0006\u0006\u001a\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u000c"
    }
    d2 = {
        "appCheck",
        "Lcom/google/firebase/appcheck/FirebaseAppCheck;",
        "Lcom/google/firebase/ktx/Firebase;",
        "getAppCheck",
        "(Lcom/google/firebase/ktx/Firebase;)Lcom/google/firebase/appcheck/FirebaseAppCheck;",
        "app",
        "Lcom/google/firebase/FirebaseApp;",
        "component1",
        "",
        "Lcom/google/firebase/appcheck/AppCheckToken;",
        "component2",
        "",
        "com.google.firebase-appcheck-firebase-appcheck"
    }
    k = 0x2
    mv = {
        0x1,
        0x7,
        0x1
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final appCheck(Lcom/google/firebase/ktx/Firebase;Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/FirebaseAppCheck;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "app"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    invoke-static {p1}, Lcom/google/firebase/appcheck/FirebaseAppCheck;->getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/appcheck/FirebaseAppCheck;

    move-result-object p0

    const-string p1, "getInstance(app)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final component1(Lcom/google/firebase/appcheck/AppCheckToken;)Ljava/lang/String;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/AppCheckToken;->getToken()Ljava/lang/String;

    move-result-object p0

    const-string v0, "token"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final component2(Lcom/google/firebase/appcheck/AppCheckToken;)J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
        message = "Migrate to use the KTX API from the main module: https://firebase.google.com/docs/android/kotlin-migration."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = ""
            imports = {}
        .end subannotation
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Lcom/google/firebase/appcheck/AppCheckToken;->getExpireTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final getAppCheck(Lcom/google/firebase/ktx/Firebase;)Lcom/google/firebase/appcheck/FirebaseAppCheck;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    invoke-static {}, Lcom/google/firebase/appcheck/FirebaseAppCheck;->getInstance()Lcom/google/firebase/appcheck/FirebaseAppCheck;

    move-result-object p0

    const-string v0, "getInstance()"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
