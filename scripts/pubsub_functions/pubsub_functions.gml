function pubsub_subscribe(_event, _func) {
    with (obj_pubsub_controller) {
        subscribe(other.id, _event, _func);
        return true;
    }
    return false;
}

function pubsub_unsubscribe(_event) {
    with (obj_pubsub_controller) {
        unsubscribe(other.id, _event);
        return true;
    }
    return false;
}

function pubsub_unsubscribe_all() {
	with (obj_pubsub_controller) {
        unsubscribe_all(other.id);
        return true;
    }
    return false;
}

function pubsub_publish(_event, _data) {
    with (obj_pubsub_controller) {
        publish(_event, _data);
        return true;
    }
    return false;
}