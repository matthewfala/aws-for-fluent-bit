
function reduce_log_event(tag, timestamp, record)
    new_record = record
    new_record["lstm_tokenize"] = nil
    new_record["edge_ai_threat"]=0
    if new_record["tf_out"][1] > 0.5 then
        new_record["edge_ai_threat"] = 1
    end
    new_record["edge_ai_severity"]=math.floor(new_record["tf_out"][1]*10 + 0.5)
    new_record["inference_time"] = nil
    new_record["tf_out"] = nil
    return 1, timestamp, record
end