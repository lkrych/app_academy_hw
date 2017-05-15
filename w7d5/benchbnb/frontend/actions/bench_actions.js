export const RECEIVE_BENCHES = "RECEIVE_BENCHES";
export const RECEIVE_BENCH = "RECEIVE_BENCH";

import * as APIUtil from '../util/bench_api_util';

const receiveBenches = (benches) => ({
  type: RECEIVE_BENCHES,
  benches
});

const receiveBench = (bench) => ({
  type: RECEIVE_BENCH,
  bench
});


export const fetchBenches = () => dispatch => {
  return APIUtil.fetchBenches().then(
    benches => dispatch(receiveBenches(benches)));
};

export const createBench = (bench) => dispatch => {
  return APIUtil.createBench(bench).then(
    newBench => dispatch(receiveBench(newBench)));
};
