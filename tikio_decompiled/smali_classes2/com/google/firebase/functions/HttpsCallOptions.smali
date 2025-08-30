.class Lcom/google/firebase/functions/HttpsCallOptions;
.super Ljava/lang/Object;
.source "HttpsCallOptions.java"


# static fields
.field private static final DEFAULT_TIMEOUT:J = 0x46L

.field private static final DEFAULT_TIMEOUT_UNITS:Ljava/util/concurrent/TimeUnit;


# instance fields
.field private final limitedUseAppCheckTokens:Z

.field private timeout:J

.field private timeoutUnits:Ljava/util/concurrent/TimeUnit;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sput-object v0, Lcom/google/firebase/functions/HttpsCallOptions;->DEFAULT_TIMEOUT_UNITS:Ljava/util/concurrent/TimeUnit;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x46

    .line 28
    iput-wide v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeout:J

    .line 29
    sget-object v0, Lcom/google/firebase/functions/HttpsCallOptions;->DEFAULT_TIMEOUT_UNITS:Ljava/util/concurrent/TimeUnit;

    iput-object v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeoutUnits:Ljava/util/concurrent/TimeUnit;

    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->limitedUseAppCheckTokens:Z

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/functions/HttpsCallableOptions;)V
    .locals 2

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x46

    .line 28
    iput-wide v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeout:J

    .line 29
    sget-object v0, Lcom/google/firebase/functions/HttpsCallOptions;->DEFAULT_TIMEOUT_UNITS:Ljava/util/concurrent/TimeUnit;

    iput-object v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeoutUnits:Ljava/util/concurrent/TimeUnit;

    .line 35
    invoke-virtual {p1}, Lcom/google/firebase/functions/HttpsCallableOptions;->getLimitedUseAppCheckTokens()Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/firebase/functions/HttpsCallOptions;->limitedUseAppCheckTokens:Z

    return-void
.end method


# virtual methods
.method apply(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;
    .locals 3

    .line 69
    invoke-virtual {p1}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    iget-wide v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeout:J

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeoutUnits:Ljava/util/concurrent/TimeUnit;

    .line 70
    invoke-virtual {p1, v0, v1, v2}, Lokhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    iget-wide v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeout:J

    iget-object v2, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeoutUnits:Ljava/util/concurrent/TimeUnit;

    .line 71
    invoke-virtual {p1, v0, v1, v2}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object p1

    return-object p1
.end method

.method getLimitedUseAppCheckTokens()Z
    .locals 1

    .line 63
    iget-boolean v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->limitedUseAppCheckTokens:Z

    return v0
.end method

.method getTimeout()J
    .locals 3

    .line 59
    iget-object v0, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeoutUnits:Ljava/util/concurrent/TimeUnit;

    iget-wide v1, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeout:J

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    return-wide v0
.end method

.method setTimeout(JLjava/util/concurrent/TimeUnit;)V
    .locals 0

    .line 49
    iput-wide p1, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeout:J

    .line 50
    iput-object p3, p0, Lcom/google/firebase/functions/HttpsCallOptions;->timeoutUnits:Ljava/util/concurrent/TimeUnit;

    return-void
.end method
