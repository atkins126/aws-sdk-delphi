unit AWS.Enums;

{$I AWS.inc}

interface

type
  /// <summary>
  /// The valid hashing algorithm supported by the sdk for request signing.
  /// </summary>
  TSigningAlgorithm = (HmacSHA1, HmacSHA256);

  /// <summary>
  /// S3 US East 1 endpoint value determines wheter or not
  /// to send the us-east-1 s3 requests to the regional endpoint or to
  /// the legacy global endpoint
  /// </summary>
  TS3UsEast1RegionalEndpointValue = (
    /// <summary>
    /// Sends the requests to the legacy global s3 endpoint for us-east-1
    /// </summary>
    Legacy,
    /// <summary>
    /// Sends the request to the regional s3 endpoint for us-east-1
    /// </summary>
    Regional
  );

  /// <summary>
  /// RetryMode determines which request retry mode is used for requests that do
  /// not complete successfully.
  /// </summary>
  TRequestRetryMode = (
    /// <summary>
    /// Legacy request retry strategy.
    /// </summary>
    Legacy,
    /// <summary>
    /// Standardized request retry strategy that is consistent across all SDKs.
    /// </summary>
    Standard,
    /// <summary>
    /// An experimental request retry strategy that builds on the Standard strategy
    /// and introduces congestion control through client side rate limiting.
    /// </summary>
    Adaptive
  );

implementation

end.
