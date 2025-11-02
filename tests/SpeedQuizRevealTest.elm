module SpeedQuizRevealTest exposing (suite)

import Expect exposing (Expectation)
import Route.SpeedQuiz exposing (shouldRevealRealStats)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "shouldRevealRealStats"
        [ test "does not reveal real stats before answering" shouldNotRevealWhenNotWaiting
        , test "reveals real stats after answering" shouldRevealWhenWaiting
        ]


shouldNotRevealWhenNotWaiting : () -> Expectation
shouldNotRevealWhenNotWaiting _ =
    let
        actual = shouldRevealRealStats False
    in
    Expect.equal False actual


shouldRevealWhenWaiting : () -> Expectation
shouldRevealWhenWaiting _ =
    let
        actual = shouldRevealRealStats True
    in
    Expect.equal True actual
